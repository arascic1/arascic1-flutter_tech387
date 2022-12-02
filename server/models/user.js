const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name: {
        required: true,
        type: String, 
        trim: true
    },

    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: (value) = {
                
            }
        }
    }
})