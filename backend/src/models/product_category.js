'use strict';
const {
    Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Product_category extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
        }
    }
    Product_category.init({
        name: DataTypes.STRING,
        desc: DataTypes.TEXT
    }, {
        sequelize,
        modelName: 'Product_category',
        timestamps: false,
        freezeTableName: true
    });
    return Product_category;
};