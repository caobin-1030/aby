import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import MintUI from 'mint-ui'
//引入mint-ui组件库的样式
import 'mint-ui/lib/style.css'
//引入字体图标
import './font/iconfont.css'
import 'swiper/dist/css/swiper.css'

//iview
// import iView from 'iview';
// import 'iview/dist/styles/iview.css';


axios.defaults.baseURL="http://127.0.0.1:3000/"
axios.defaults.withCredentials=true
Vue.prototype.axios=axios
Vue.use(MintUI)
Vue.config.productionTip = false
// Vue.use(iView)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
