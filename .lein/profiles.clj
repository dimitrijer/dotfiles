{:user {:plugins [[cider/cider-nrepl  "0.15.0"]
                  [venantius/ultra "0.5.1"]
                  [jonase/eastwood "0.2.4"]
                  [lein-ancient "0.6.10"]
                  [lein-kibit "0.1.5"]
                  [lein-bikeshed "0.4.1"]]
        :dependencies [[pjstadig/humane-test-output  "0.8.2"]
                       [slamhound "1.5.5"]]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :mirrors {#".+" {:name "nordeus-nexus"
                         :url "https://nexus.hq.nordeus.com/content/groups/public/"}}}
 :auth {:repository-auth {#"nexus\.hq\.nordeus\.com" {:username "#######"
                                                      :password "#######" }}}}
