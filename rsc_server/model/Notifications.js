const mongoose = require("mongoose")

const notificationSchema = mongoose.Schema({
    uuid: {
        type: mongoose.Schema.Types.ObjectId,
        required: true
    },
    
    sourceUser: {
        type: String, 
        required: true
    },

    projectTitle: {
        type: String, 
        required: true
    },

    message: { 
        type: String, 
        required: true
    },

    //add an indicator of read and unread?
    
},{timestamps: true})

const Notification = mongoose.model("notification", notificationSchema)

// Exports
module.exports = Notification