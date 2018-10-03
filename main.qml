import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtMultimedia 5.8
import org.qtproject.example 1.0

ApplicationWindow{
    id:mainWin
    title: qsTr("Cabinet_Umbrella_Foundation -- Management")
    height: 600; width: 1000
    visible: true
    onHeightChanged: animOpen.start()
    onVisibleChanged: login.open()

Rectangle {

    id :win
    width: mainWin.width; height: mainWin.height
    property string user: "Administrateur"
    LinearGradient {
              anchors.fill: parent
              start: Qt.point(0, 0)
              end: Qt.point(0, parent.height)

              gradient: Gradient {
                  GradientStop { position: 0.0; color: "#337" }
                  GradientStop { position: 0.4; color: "#114" }
                  GradientStop { position: 0.6; color: "#114" }
                  GradientStop { position: 1.0; color: "#337" }
              }
          }

    MenuGeneral{
    clip: true
    onQuitter: {dialogue.open(); dialogue.state="quitter"}
    onAide: {dialogue.open(); dialogue.state="aide"}
    onAccueil: {login.open()}
    onParametres: { animClose.start();
        axexC.target=settings;
        axex.target=settings; scale.target=settings;
        animOpen.start();
        }
    onStatistiques:  { animClose.start();
        axexC.target=stats;
        axex.target=stats; scale.target=stats;
        animOpen.start();
        }
    onRendezVous: { animClose.start();
        axexC.target=rendezVous;
        axex.target=rendezVous; scale.target=rendezVous;
        animOpen.start();
        }
    onTresorerie: { animClose.start();
        axexC.target=treasure;
        axex.target=treasure; scale.target=treasure;
        animOpen.start();
        }
    onDossiers: { animClose.start();
        axexC.target=folders;
        axex.target=folders; scale.target=folders;
        animOpen.start();
        }
    onMedicaments: { animClose.start();
        axexC.target=medicine;
        axex.target=medicine; scale.target=medicine;
        animOpen.start();
        }
    onMaladies: { animClose.start();
        axexC.target=diseases;
        axex.target=diseases; scale.target=diseases;
        animOpen.start();
        }
    onPatients: { animClose.start();
        axexC.target=patients;
        axex.target=patients; scale.target=patients;
        animOpen.start();
        }
    onMedecins: { animClose.start();
        axexC.target=doctors;
        axex.target=doctors; scale.target=doctors;
        animOpen.start();
        }

    }
    Parametres{
        id:settings
    }
    Statistiques{
        id:stats
    }
    RendezVous{
        id:rendezVous
    }
    Tresorerie{
        id:treasure
    }
    Dossiers{
        id:folders
    }
    Medicaments{
        id:medicine
    }
    Maladies{
        id:diseases
    }
    Patients{
        id:patients
    }
    Medecins{
        id:doctors
    }
    Accueil{
        id:login
        onAcceptedLogin: {  login.close()}
        onRejectedLogin: {dialogue.open(); dialogue.state="quitter"}
    }



    Dialogueur{
        id:dialogue
        onAcceptedQuit: {login.quitter() }
        onRejected: close()
    }


    ParallelAnimation{
        id: animOpen
       NumberAnimation {
            id:axex
            property: "x"
            from:win.width
            to: win.width/8+2
            duration: 50
        }
        NumberAnimation {
            id: scale
            property: "scale"
            from: 0.5
            to: 1
            duration: 1000
            easing.type: Easing.OutBack
        }
    }
    ParallelAnimation{
        id: animClose
        NumberAnimation {
            id:axexC
            property: "x"
            to: win.width
            duration: 50
            easing.type: Easing.OutInBounce
        }
    }

}



}
