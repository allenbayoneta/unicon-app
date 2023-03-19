// Route for app.js
const express = require('express')
const router = express.Router()
const notificationController = require("../controller/notificationController")
// Middleware
router.use((req, res, next) => {
    // Some code to log requests in the console
    return next()
})

router.get("/uuid=:uuid", async (req, res) => {
    try {
        const notifications = await notificationController.getClientNotification(req.params.uuid)
        if (notifications === null) return res.sendStatus(404)
        return res.status(200).send(notifications)
    } catch (err) {
        if (process.env.NODE_ENV === "development") console.log(getDate(Date.now()), err.message)
        return res.sendStatus(err.code)
    }
})

router.delete("/notifId=:notifId", async (req, res) => {
    try{
        await notificationController.deleteNotification(req.params.notifId)
        return res.sendStatus(200)
    } catch (err){
        if (process.env.NODE_ENV === "development") console.log(getDate(Date.now()), err.message)
        return res.sendStatus(err.code)
    }
})

router.post("/testcreate", async (req, res) => {
    try{
        await notificationController.createNotification(req.body.uuid,req.params.sourceId,req.body.projectId,req.body.message)
        return res.sendStatus(200)
    } catch (err){
        if (process.env.NODE_ENV === "development") console.log(getDate(Date.now()), err.message)
        return res.sendStatus(err.code)
    }
})

module.exports = router