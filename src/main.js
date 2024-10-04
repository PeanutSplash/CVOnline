import './assets/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'
import './assets/main.css'
// import '@vue-office/pdf/lib/index.css'

const app = createApp(App)

app.use(createPinia())

app.mount('#app')
