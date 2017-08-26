{:user {:plugins [[cider/cider-nrepl  "0.13.0"]
                  [venantius/ultra "0.5.1"]
                  [jonase/eastwood "0.2.3"]
                  [lein-ancient "0.6.10"]
                  [lein-kibit "0.1.5"]
                  [lein-bikeshed "0.4.1"]]
        :dependencies [[pjstadig/humane-test-output  "0.8.1"]
                       [slamhound "1.5.5"]]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}