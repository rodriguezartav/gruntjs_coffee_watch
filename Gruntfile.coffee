class Helper

module.exports = (grunt) ->

  grunt.initConfig
    
    clean:
      lib:
        src: "/javascript/**/*.*"
      unit: 
        src: "/test/unit/*.*"

    coffee:
      lib: 
        expand: true,
        flatten: true,
        cwd: './src/',
        src: ['*.coffee'],
        dest: './javascript/single',
        ext: '.js'
      
      
      concat:
        files:
          "./javascript/concat/index.js" : ["./src/*.coffee"]
        
      unit:
        expand: true,
        flatten: true,
        cwd: './test/unit-src',
        src: ['*.coffee'],
        dest: './test/unit',
        ext: '.js'
      
        
    watch:
      coffee:
        files: ["./src/*.coffee"]
        tasks: ["compile"]
        

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-coffee');

  grunt.registerTask('compile', ['clean','coffee']);   

  grunt.registerTask('dev', ['watch']);   