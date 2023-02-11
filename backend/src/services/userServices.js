import db, { sequelize } from '../models/index';
import bcrypt from 'bcryptjs';

const salt = bcrypt.genSaltSync(10);

let createNewUser = async (data) => {
   return new Promise(async (resolve, reject) => {
      try {
         let hashedPassword = await hashUserPassword(data.password);
         let result = await sequelize.query("exec createUser ?,?,?,?,?,?,?", {
            replacements: [data.username, hashedPassword, data.first_name, data.last_name, data.telephone, data.email, data.gender]
         });
         let message = result[0];
         resolve({
            message
         });
      } catch (e) {
         reject(e)
      }
   })
}

let hashUserPassword = (password) => {
   return new Promise(async (resolve, reject) => {
      try {
         let hashPassword = await bcrypt.hashSync(password, salt);
         resolve(hashPassword);
      } catch (e) {
         reject(e)
      }
   })
}

let getAllUser = () => {
   return new Promise(async (resolve, reject) => {
      try {
         let users = db.User.findAll({
            raw: true,
         });
         resolve(users)
      } catch (e) {
         reject(e)
      }
   })
}

//API-----------------------------------------------------------------------------------------------------------------------------------------------------

let handleUserLogin = (username, password) => {
   return new Promise(async (resolve, reject) => {
      try {
         let userData = {};


         if (!username || !password) {
            userData.errcode = 4;
            userData.errMessage = 'Missing inputs parameter!';
            resolve(userData)
         }


         let isExist = await checkUserEmail(username);
         if (isExist) {
            let user = await db.User.findOne({
               where: { username: username },
               raw: true
            });
            if (user) {
               let check = await bcrypt.compareSync(password, user.password);
               if (check) {
                  userData.errCode = 0;
                  userData.errMessage = 'Ok';
                  delete user.password;
                  userData.user = user;
               } else {
                  userData.errCode = 3;
                  userData.errMessage = 'Wrong password'
               }
            } else {
               userData.errCode = 2;
               userData.errMessage = 'Impossible error'
            }
         } else {
            userData.errCode = 1;
            userData.errMessage = 'Email doesn`t exist, try to register?'
         }
         resolve(userData)
      } catch (e) {
         reject(e)
      }
   })
}

let checkUserPassword = () => {
   return new Promise((resolve, reject) => {
      try {

      } catch (e) {
         reject(e)
      }
   })
}

let checkUserEmail = (username) => {
   return new Promise(async (resolve, reject) => {
      try {
         let user = await db.User.findOne({
            where: { username: username }
         })
         if (user) {
            resolve(true)
         } else {
            resolve(false)
         }
      } catch (e) {
         reject(e);
      }
   })
}

let deleteUser = (userID) => {
   return new Promise(async (resolve, reject) => {
      let user = await db.User.findOne({
         where: { id: userID }
      })
      if (!user) {
         resolve({
            errCode: 2,
            message: 'An error has occur!'
         })
      }
      if (user) {
         await user.destroy();
         resolve({
            errCode: 0,
            message: 'The user is deleted'
         })
      }
   })
}

let updateUser = (data) => {
   return new Promise(async (resolve, reject) => {
      try {
         let user = await db.User.findOne({
            where: { id: data.id }
         })
         if (user) {
            user.first_name = data.first_name;
            user.last_name = data.last_name;

            await user.save();
            resolve({
               errCode: 0,
               message: 'Update success!'
            })
         } else {
            resolve({
               errCode: 1,
               message: 'User not found!'
            })
         }

         resolve({
            errCode: 2,
            message: 'An error has occur!'
         })
      } catch (e) {
         reject(e)
      }
   })
}

module.exports = {
   handleUserLogin: handleUserLogin,
   createNewUser: createNewUser,
   getAllUser: getAllUser,
   deleteUser: deleteUser,
   updateUser: updateUser
}



