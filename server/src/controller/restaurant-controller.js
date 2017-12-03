const mysql = require('mysql')
const config = require('../config/config')

const con = mysql.createConnection(config.db)
con.connect()

module.exports = {
  search (req, res) {
    con.query('SELECT rest_id, name, cuisine, rating, address, image FROM RESTAURANT WHERE RESTAURANT.name LIKE (?) UNION ' +
    'SELECT rest_id, name, cuisine, rating, address, image FROM RESTAURANT WHERE RESTAURANT.address LIKE (?) UNION ' +
    'SELECT item_id, item_name, price, vegan, null, null FROM MENU_ITEM WHERE MENU_ITEM.item_name LIKE (?)',
      [req.body.q, req.body.q, req.body.q],
      (error, results) => {
        if (error) {
          // console.log(error)
          // console.log(results)
          res.status(400).send('Rest not found')
        } else {
          // console.log(results)
          res.status(200).send(results)
        }
      }
    )
  },
  detail (req, res) {
    con.query('SELECT * FROM (SELECT * FROM RESTAURANT NATURAL JOIN MENU_ITEM) X WHERE X.rest_id = (?)',
      [req.params.id],
      (error, results) => {
        console.log(req.params.id)
        if (error) {
          console.log(error)
          console.log(results)
          res.status(400).send('Rest not found')
        } else {
          console.log(results)
          res.status(200).send(results)
        }
      }
    )
  },
  rest (req, res) {
    con.query('SELECT rest_id, name, cuisine, rating, address, image FROM RESTAURANT WHERE RESTAURANT.address LIKE (?)',
        [req.params.location],
        (error, results) => {
          console.log(req.params.id)
          if (error) {
            console.log(error)
            console.log(results)
            res.status(400).send('Rest not found')
          } else {
            console.log(results)
            res.status(200).send(results)
          }
        }
    )
  }

}
