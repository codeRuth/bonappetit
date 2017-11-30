const mysql = require('mysql')
const config = require('../config/config')

const con = mysql.createConnection(config.db)
con.connect()

module.exports = {
  order (req, res) {
    // const cart_id = Math.floor(1000 + Math.random() * 9000);
    // con.query('',
    //     [req.body.q, req.body.q, req.body.q],
    //     (error, results) => {
    //       if (error) {
    //         // console.log(error)
    //         // console.log(results)
    //         res.status(400).send('Rest not found')
    //       } else {
    //         // console.log(results)
    //         res.status(200).send(results)
    //       }
    //     }
    // )
  },
  checkout (req, res) {
    const data = req.body.cart
    const values = []
    const cartID = Math.floor(1000 + Math.random() * 9000)

    for (let i = 0; i < data.length; i++) {
      values.push([cartID, data[i].item_id, data[i].quantity])
    }

    con.beginTransaction(function (err) {
      if (err) { throw err }
      con.query('INSERT INTO `CART_INDEX` (`cart_id`, `user_id`) VALUES (?, ?)', [cartID, 19], function (error, results, fields) {
        if (error) {
          console.log(error)
          return con.rollback(function () { throw error })
        } else { console.log(results) }
        con.query('INSERT INTO `CART` (`cart_index`, `item_id`, `quantity`) VALUES ?', [values], function (error, results, fields) {
          if (error) {
            console.log(error)
            return con.rollback(function () { throw error })
          } else { console.log(results) }
          con.commit(function (err) {
            if (err) {
              res.status(400).send('ERROR')
              return con.rollback(function () { throw err })
            } else { res.status(200).send(results) }
            console.log('success!')
          })
        })
      })
    })
  }
}
