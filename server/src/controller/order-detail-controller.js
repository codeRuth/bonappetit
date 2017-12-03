const mysql = require('mysql')
const config = require('../config/config')

const con = mysql.createConnection(config.db)
con.connect()

module.exports = {
  restDetail: function (req, res) {
    con.query('SELECT * FROM `RESTAURANT` WHERE `RESTAURANT`.rest_id = ?; SELECT `USER`.`name`, `USER`.`phone`, order_id, cart_id, del_id, total_amt, accepted, cooked, delivered, paid FROM `ORDER`, `USER` WHERE `ORDER`.rest_id = ? AND `USER`.user_id = `ORDER`.cust_id',
        [req.params.rid, req.params.rid], function (error, results) { if (error) { console.log(error) } else { res.status(200).send(results) } })
  },
  delDetail: function (req, res) {
    con.query('SELECT * FROM DELIVERER WHERE DELIVERER.del_id = ?; SELECT `RESTAURANT`.name as rname, `USER`.`name`, `USER`.`phone`, order_id, total_amt, accepted, cooked, delivered, paid FROM `ORDER`, `USER`, `RESTAURANT` WHERE `ORDER`.rest_id = RESTAURANT.rest_id AND `USER`.user_id = `ORDER`.cust_id AND `ORDER`.`del_id` = ?',
        [req.params.did, req.params.did], function (error, results) { if (error) { console.log(error) } else { res.status(200).send(results) } })
  },
  accepted: function (req, res) {
    con.query('UPDATE `ORDER` SET `accepted` = 1 WHERE `ORDER`.`order_id` = ?;', [req.body.user_id], function (error, results) { if (error) { console.log(error) } else { res.status(200).send(results) } })
  },
  cooked: function (req, res) {
    con.query('UPDATE `ORDER` SET `cooked` = 1 WHERE `ORDER`.`order_id` = ?;', [req.body.user_id], function (error, results) { if (error) { console.log(error) } else { res.status(200).send(results) } })
  },
  delivered: function (req, res) {
    con.query('UPDATE `ORDER` SET `delivered` = 1 WHERE `ORDER`.`order_id` = ?;', [req.body.user_id], function (error, results) { if (error) { console.log(error) } else { res.status(200).send(results) } })
  }
}
