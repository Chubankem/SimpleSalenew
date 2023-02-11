import userServices from '../services/userServices'

let getListUser = async (req, res) => {
   let data = await userServices.getAllUser()
   return res.render('manageUser/listuserpage', {
      listUser: data
   });
}

let getCreateUserPage = (req, res) => {
   return res.render('manageUser/createuserpage')
}

let postCreateUser = async (req, res) => {
   let message = await userServices.createNewUser(req.body);
   console.log(message);
   return getListUser(req, res);
}

let handleLogin = async (req, res) => {

   let username = req.body.username;
   let password = req.body.password;
   let userData = await userServices.handleUserLogin(username, password)

   if (userData.errCode == 0) {
      return res.status(200).json({
         userData
      })
   } else {
      return res.status(500).json({
         userData
      })
   }
}

let handleCreateNewUser = async (req, res) => {
   let message = await userServices.createNewUser(req.body);
   return res.status(201).json(message);
}

let handleEditNewUser = async (req, res) => {
   let data = req.body;
   let message = await userServices.updateUser(data);
   return res.status(200).json(message);
}

let handleDeleteNewUser = async (req, res) => {
   let message = await userServices.deleteUser(req.body.id);
   return res.status(200).json(message);
}

module.exports = {
   handleLogin: handleLogin,
   getListUser: getListUser,
   getCreateUserPage: getCreateUserPage,
   postCreateUser: postCreateUser,
   handleCreateNewUser: handleCreateNewUser,
   handleEditNewUser: handleEditNewUser,
   handleDeleteNewUser: handleDeleteNewUser
}