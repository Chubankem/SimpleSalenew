import Express from "express";
import homeController from "../controllers/homeController";
import userController from '../controllers/userController';

let router = Express.Router();

let initWebRoutes = (app) => {
    //Notejs----------------------------------------------------------------------------------------------------------------------------------------------------------------
    router.get('/', homeController.getHomePage);
    router.get('/about', homeController.getAboutPage);

    router.get('/manage_user', userController.getListUser);
    router.get('/ma_user_create', userController.getCreateUserPage);
    router.post('/post_createuser', userController.postCreateUser);
    //API-------------------------------------------------------------------------------------------------------------------------------------------------------------
    router.post('/api/login', userController.handleLogin)
    router.post('/api/create_new_user', userController.handleCreateNewUser);
    router.put('/api/edit_new_user', userController.handleEditNewUser);
    router.delete('/api/delete_new_user', userController.handleDeleteNewUser);


    return app.use("/", router);
}

module.exports = initWebRoutes;