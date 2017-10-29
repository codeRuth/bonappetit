const mysql = require('mysql')
const config = require('../config/config')
const bcrypt = require('bcrypt')

const con = mysql.createConnection(config.db)
con.connect()
// ^[789]\d{9}$

module.exports = {
  register (req, res) {
    let hash = bcrypt.hashSync(req.body.password, 10)
    con.query('INSERT INTO USER_DB (email, password) VALUES (?, ?)',
        [req.body.email, hash],
        (error, results) => {
          if (error) {
            console.log(error)
            res.status(400).send('user email already present')
          } else {
            console.log('User Created Successfully!!')
            res.status(200).send(results)
          }
        }
    )
    // con.end()
  },
  login (req, res) {
    let hash = bcrypt.hashSync(req.body.password, 10)
    con.query('SELECT * FROM USER_DB WHERE email = (?) ',
        [req.body.email, hash],
        (error, results) => {
          if (error) {
            console.log(error)
            res.status(400).send({
              error: 'email already present'
            })
          } else {
            console.log('User Created Successfully!!')
            res.status(200).send(results)
          }
        }
    )
  }

}
