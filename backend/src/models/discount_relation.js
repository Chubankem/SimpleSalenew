'use strict';
const {
    Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Discount_relation extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
        }
    }
    Discount_relation.init({
        product_id: DataTypes.INTEGER,
        discount_id: DataTypes.INTEGER
    }, {
        sequelize,
        modelName: 'Discount_relation',
        timestamps: false,
        freezeTableName: true
    });
    return Discount_relation;
};