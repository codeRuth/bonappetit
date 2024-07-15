module.exports = {
  port: process.env.PORT || 5001,
  db: {
    host: process.env.DB_HOST || '127.0.0.1',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_DATABASE || 'bonAppetit',
    multipleStatements: true
  },
  auth: {
    jwtSecret: process.env.JWT_SECRET || 'ambrosia'
  }
}
