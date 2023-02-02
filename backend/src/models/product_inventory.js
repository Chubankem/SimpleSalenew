'use strict';
const {
    Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Product_inventory extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
        }
    }
    Product_inventory.init({
        prod_quantity: DataTypes.INTEGER
    }, {
        sequelize,
        modelName: 'Product_inventory',
        timestamps: false,
        freezeTableName: true
    });
    return Product_inventory;
};