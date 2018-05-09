<template>
  <div class="idoren2">
    <el-row>
    <el-col :span="8">
      <h3>{{ msg }}</h3>
      <el-menu
        default-activate="1"
        class="el-menu-vertical-demo"
        @open="handleOpen"
        @close="handleClose">
        <el-submenu index="1">
          <template slot="title">
            <span>境遇が変わったとき</span>
          </template>
          <el-menu-item index="1-1">職場異動</el-menu-item>
          <el-menu-item index="1-2">事業所・TEC移動</el-menu-item>
          <el-menu-item index="1-2">フロア・座席移動</el-menu-item>
          <el-menu-item index="1-3">出向</el-menu-item>
          <el-menu-item index="1-4">産休</el-menu-item>
          <el-menu-item index="1-5">海外赴任</el-menu-item>
          <el-menu-item index="1-6">海外留学</el-menu-item>
          <el-menu-item index="1-7">時短勤務</el-menu-item>
          <el-menu-item index="1-8">夫婦組合員</el-menu-item>
        </el-submenu>
        <el-submenu index="2">
          <template slot="title">
            <span>役割が変わったとき</span>
          </template>
          <el-menu-item index="2-1">職場委員</el-menu-item>
          <el-menu-item index="2-2">代議員</el-menu-item>
        </el-submenu>
        <el-submenu index="3">
          <template slot="title">
            <span>共済金を申請するとき</span>
          </template>
          <el-menu-item index="3-1">結婚</el-menu-item>
          <el-menu-item index="3-2">出産</el-menu-item>
          <el-menu-item index="3-3">小学校入学</el-menu-item>
          <el-menu-item index="3-4">転籍・退職</el-menu-item>
          <el-menu-item index="3-5">I6・M6昇格</el-menu-item>
          <el-menu-item index="3-6">災害</el-menu-item>
          <el-menu-item index="3-7">入院</el-menu-item>
          <el-menu-item index="3-8">死亡</el-menu-item>
        </el-submenu>
        <el-submenu index="4">
          <template slot="title">
            <span>相談したいとき</span>
          </template>
          <el-menu-item index="4-1">会社生活</el-menu-item>
          <el-menu-item index="4-2">職場環境</el-menu-item>
        </el-submenu>
        <el-menu-item index="5">
          <i class="el-icon-message"></i>
          <span>お問い合わせ</span>
        </el-menu-item>
        <el-menu-item index="6">
          <i class="el-icon-question"></i>
          <span>使い方</span>
        </el-menu-item>
      </el-menu>
    </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'IdoRen2',
  data () {
    return {
      msg: '勝手に異動連2.0（仮）'
    }
  },
  methods: {
    handleOpen (key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose (key, keyPath) {
      console.log(key, keyPath);
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.el-menu-vertical-demo {
  width: 250px;
  min-height: 400px;
}
</style>
