const mysql = require('mysql')
const config = require('../config/config')

const con = mysql.createConnection(config.db)
con.connect()

module.exports = {
  order: function (req, res) {
    con.query(('SET @orderTotal = 0; SET @gst = 0; SET @payableAmount = 0; CALL getPayAmount(@orderTotal, @gst, @payableAmount, ?); SELECT @orderTotal, @gst, @payableAmount;'),
      [req.body.cartID],
      (error, results) => {
        if (error) {
          console.log(error)
          console.log(results)
          res.status(400).send('ERROR')
        } else {
          console.log(results)
          res.status(200).send(results)
        }
      }
    )
  },
  payment: function (req, res) {
    con.query(
      'INSERT INTO `ORDER` (`rest_id`, `cust_id`, `cart_id`, `total_amt`, `accepted`, `cooked`, `delivered`, `paid`) ' +
      'VALUES (?, ?, ?, ?, 0, 0, 0, ?);',
      [req.body.rest_id, req.body.cust_id, req.body.cart_id, req.body.total_amt, req.body.paid],
      (error, results) => {
        if (error) {
          console.log(error)
          console.log(results)
          res.status(400).send('ERROR')
        } else {
          console.log(results)
          res.status(200).send(results)
        }
      }
    )
  },
  orderDetail: function (req, res) {
    con.query('SELECT RESTAURANT.name, order_id, cart_id, del_id, total_amt, accepted, cooked, delivered, paid FROM `ORDER`, `RESTAURANT` WHERE cust_id = ? AND RESTAURANT.rest_id = `ORDER`.rest_id;',
      [req.body.user_id],
      (error, results) => {
        if (error) {
          console.log(error)
          console.log(results)
          res.status(400).send('ERROR')
        } else {
          console.log(results)
          res.status(200).send(results)
        }
      }
    )
  },
  checkout: function (req, res) {
    const data = req.body.cart
    const values = []
    const cartID = Math.floor(1000 + Math.random() * 9000)

    for (let i = 0; i < data.length; i++) {
      values.push([cartID, data[i].item_id, data[i].quantity])
    }
    con.beginTransaction(function (err) {
      if (err) {
        throw err
      }
      con.query('INSERT INTO `CART_INDEX` (`cart_id`) VALUES (?)', [cartID], function (error, results, fields) {
        if (error) {
          console.log(error)
          return con.rollback(function () {
            throw error
          })
        } else {
          console.log(results)
        }
        con.query('INSERT INTO `CART` (`cart_index`, `item_id`, `quantity`) VALUES ?', [values], function (error, results, fields) {
          if (error) {
            console.log(error)
            return con.rollback(function () {
              throw error
            })
          } else {
            console.log(results)
          }
          con.commit(function (err) {
            if (err) {
              res.status(400).send('ERROR')
              return con.rollback(function () {
                throw err
              })
            } else {
              res.status(200).send({
                'cartID': cartID
              })
            }
            console.log('success!')
          })
        })
      })
    })
  }
}