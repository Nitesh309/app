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
        stage('BUILD & PACKAGE'){
            steps{
                dir ('maven-ap'){
                    sh 'mvn package'
                }
            }
        }    
   }
}
