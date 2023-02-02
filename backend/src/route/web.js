import Express from "express";
import homeController from "../controllers/homeController"

let router = Express.Router();

let initWebRoutes = (app) => {

    router.get('/', homeController.getHomePage);
    return app.use("/", router);

}

module.exports = initWebRoutes;