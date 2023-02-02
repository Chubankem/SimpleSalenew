import db from "../models/index"

let getHomePage = async (req, res) => {
    let data = await db.Product.findAll();
    console.log(data);
    return res.render('homepage.ejs');
}

module.exports = {
    getHomePage: getHomePage
}