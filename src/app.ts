import express, { Application } from 'express'
import cors from 'cors'

const app: app = express()
            app.use(express.json())
app.use(cors())
app.use(express.urlencoded({ extended: true }))

export default app
