pipeline {
    agent {
        docker {
            image "joyzoursky/python-chromedriver"
        }
    }

    stages {
        stage ("Preparation") {
            steps {
                sh "pip install -r requirements.txt"                
            }
        }
        stage ("Tests") {
            steps {
                sh "robot -d ./logs  tests"
            }
            post {
                always {
                    robot otherFiles: "**/*.png", outputPath: "logs"
                }
            }
        }
        stage ("UAT") {
            steps {
                input (message: "Pode ir para produção?", ok: "Sim")
                echo "Simulando deploy em produção!"
            }
        }
        stage ("Prod") {
            steps {
                echo "Produção Ok!"
            }
        }
    }
}