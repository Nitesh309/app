pipeline{
    agent any
    tools {
        maven 'mvn'
    }
    stages{
        stage('clone-code'){
            steps{
               git branch: 'main', credentialsId: 'tisha-github-repo', url: 'https://github.com/devopsdecode/april-2025.git'  
            }
        }
        stage('Maven instations check'){
            steps{
                sh 'mvn --version'
            }
        }
        stage('Stage3 Maven validation'){
            steps{
                dir ('maven-app'){
                sh 'mvn validate'
       }
     }
   }
     stage('Stage4 Maven compile'){
            steps{
                dir ('maven-app'){
                sh 'mvn clean compile'
                }
            }
        }        
        stage('Stage5 Maven test'){
            steps{
                dir ('maven-app'){
                sh 'mvn test'
                }
            }
        }    
        stage('Stage6 Maven package'){
            steps{
                dir ('maven-app'){
                sh 'mvn package'
       }
     }
    }
   }
}
