const mysql = require('mysql')
const config = require('../config/config')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

function jwtSignUser (user) {
  const ONE_WEEK = 60 * 60 * 24 * 7
  return jwt.sign(user, config.auth.jwtSecret, {
    expiresIn: ONE_WEEK
  })
}

const con = mysql.createConnection(config.db)
con.connect()
// ^[789]\d{9}$

module.exports = {
  register (req, res) {
    let hash = bcrypt.hashSync(req.body.password, 10)
    con.query('INSERT INTO USER (name, email, password, phone, address) VALUES (?, ?, ?, ?, ?)',
        [req.body.name, req.body.email, hash, req.body.number, req.body.address],
        (error, results) => {
          if (error) {
            console.log(error)
            console.log(results)
            res.status(400).send('Phone Number Already Present.')
          } else {
            // console.log(req)
            console.log('User Created Successfully.')
            console.log(results)
            res.status(200).send(results)
          }
        }
    )
  },
  login (req, res) {
    con.query('SELECT phone, password FROM USER WHERE phone = (?) ',
        [req.body.number],
        (error, results) => {
          if (error) {
            console.log(error)
            res.status(400).send({
              error: 'User does not exist.'
            })
          } else {
            if (results.length === 0) {
              res.status(200).send({
                message: 'No User with Phone Number found'
              })
            } else {
              console.log(results)
              if (bcrypt.compareSync(req.body.password, results[0].password)) {
                console.log(jwtSignUser(results[0].phone))
                console.log(results)
                res.status(200).send({
                  message: 'Password Match'
                })
              } else {
                res.status(200).send({
                  message: 'Password Dont match'
                })
              }
            }
          }
        })
  }
}
