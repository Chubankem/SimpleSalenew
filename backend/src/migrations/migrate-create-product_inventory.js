'use strict';
module.exports = {
    async up(queryInterface, Sequelize) {
        await queryInterface.createTable('Product_inventory', {
            id: {
                allowNull: false,
                primaryKey: true,
                type: Sequelize.INTEGER
            },
            prod_quantity: {
                type: Sequelize.INTEGER
            },
        });
    },
    async down(queryInterface, Sequelize) {
        await queryInterface.dropTable('Product_inventory');
    }
};