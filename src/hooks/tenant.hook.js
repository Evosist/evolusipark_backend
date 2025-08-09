// hooks/tenant.hook.js
function addTenantBeforeCreateHook(sequelize) {
    Object.values(sequelize.models).forEach((model) => {
        // cek apakah model punya kolom tenant_id
        if (model.rawAttributes.tenant_id) {
            model.addHook('beforeCreate', (instance, options) => {
                if (options.tenant_id) {
                    instance.tenant_id = options.tenant_id
                }
            })

            // kalau mau support bulkCreate
            model.addHook('beforeBulkCreate', (instances, options) => {
                if (options.tenant_id) {
                    instances.forEach((instance) => {
                        instance.tenant_id = options.tenant_id
                    })
                }
            })
        }
    })
}

module.exports = addTenantBeforeCreateHook
