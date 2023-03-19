const Client = require("../model/Clients")
const Provider = require("../model/Providers")
const Project = require("../model/Projects")
const Notification = require("../model/Notifications")
const raise = require("../utils/raise")

/**
 * @param {string} sourceId
 * @param {string} destId
 * @param {string} projectId
 * @param {string} message
 * @returns 
 */
function createNotification(destId,sourceId,projectId,message){
    return new Promise(async (resolve, reject) => {
    const source = await Provider.findOne({ sourceId: sourceId })
    const project = await Project.findOne({ _id: projectId })
    const name = source.name
    const title = project.title
    Notification.create({
        uuid : destId,
        sourceUser: name,
        projectTitle: title,
        message: message,
        }).then(resolve(null))
        .catch(err => reject(raise(err.message, 400)))
    })
    
    //could use the values to send a push notification?
}

/**
 * @param {*} 
 * @returns 
 * Delete a Notification
 */
function deleteNotification(notifId){
    return new Promise(async (resolve, reject) =>{
        await Notification.findOneAndDelete({_id: notifId})
        .then(resolve(null))
        .catch(err => reject(raise(err.message, 400)))
    })
} 

/**
 * @param {string} uuid
 * @returns
 * get all the notifs of the provider based on uuid
 */
function getClientNotification(uuid){
    return new Promise(async (resolve, reject) =>{
    await Notification.find({uuid:uuid})
    .then(notifs => {
        if (notifs.length == 0) return resolve(null)
        return resolve(notifs)
    })
    .catch(err => reject(raise(err.message, 400)))
    })
}

module.exports.createNotification = createNotification
module.exports.deleteNotification = deleteNotification
module.exports.getClientNotification = getClientNotification