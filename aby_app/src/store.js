import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    uid:-1
  },
  mutations: {
    setUid(state,id){
      state.uid=id;
    }
  },
  actions: {
    upUid(context){
      context.commit("setUid",1)
    },
    downUid(context){
      context.commit("setUid",-1)
    }
  },
  getters:{
    getUid(state){
      return state.uid
    }
  }
})
