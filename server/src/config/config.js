module.exports = {
  port: process.env.PORT || 5000,
  db: {
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || 'codeRuth@3910',
    database: process.env.DB_DATABASE || 'bonAppetit'
  },
  auth: {
    jwtSecret: process.env.JWT_SECRET || 'ambrosia'
  }
}
