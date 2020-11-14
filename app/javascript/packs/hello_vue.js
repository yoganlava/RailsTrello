import Vue from 'vue'
import App from '../app.vue'
import router from '../routes'
import Route from '../plugins/router'
document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
        render: h => h(App),
        router,
        components: {
            Route
        }
    }).$mount()
    document.body.appendChild(app.$el)
    console.log(app)
})