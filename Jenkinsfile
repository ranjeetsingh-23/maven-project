pipeline {
    agent any
    tools {
        maven 'localMaven'
    }


    triggers {
         pollSCM('* * * * *')
     }

    stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage ('Deployments'){
            parallel{
                stage ('Deploy to Staging'){
                    steps {
                        sh "cp **/target/*.war /opt/apache-tomcat-8.5.35_dev/webapps"
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                        sh "cp  **/target/*.war /opt/apache-tomcat-8.5.35_prod/webapps"
                    }
                }
            }
        }
    }
}
