{:user {:plugins [[cider/cider-nrepl  "0.18.0"]
                  [venantius/ultra "0.5.2"]
                  [jonase/eastwood "0.3.4"]
                  [lein-ancient "0.6.15"]
                  [lein-kibit "0.1.6"]
                  [lein-bikeshed "0.5.1"]]
        :dependencies [[pjstadig/humane-test-output  "0.9.0"]
                       [slamhound "1.5.5"]]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]
 :auth {:repository-auth {#"nexus\.hq\.nordeus\.com" {:username "#######"
                                                      :password "#######" }}}}
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}
 :nordeus {:mirrors {#".+" {:name "nordeus-nexus"
                            :url "https://nexus.hq.nordeus.com/content/groups/public/"}}}
