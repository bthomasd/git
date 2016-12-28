(ns clojure-noob.core
     (:gen-class))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "I'm a little teapot!"))

(defn train
  []
  (println "Choo choo!"))

(println "Cleanliness is next to godliness") 

(comment 
         (map (comp record first)
              (d/q '[:find ?post
                     :in $ ?search
                     :where
                     [(fulltext $ :post/content ?search)
                      [[?post ?content]]]]
                   (db/db)
                   (:q params))))

(defn x-chop
  "Describe your favorite chop."
  ([name chop-type]
   (str "I " chop-type " chop " name "! Take that!"))
  ([name]
   (x-chop name "karate")))

(defn weird-arity
  ([]
   "Destiny dressed you this morning, my friend.")
  ([number]
   (inc number)))

(defn codger-communication
  [whippersnapper]
  (str "Get off my lawn, " whippersnapper))

(defn codger
  [& whippersnappers]
  (map codger-communication whippersnappers))

(defn favorite-things
  [name & things]
  (str "Hi, " name ", here are my favorite things: "
       (clojure.string/join ", " things)))

(defn my-first
  [[first-thing]]
  first-thing)

(defn chooser
  [[first-choice second-choice & unimportant-choices]]
  (println (str "Your first choice is: " first-choice))
  (println (str "Your second choice is: " second-choice))
  (println (str "We're ignoring the rest of your choices. "
                "Here they are just in case: "
                (clojure.string/join ", " unimportant-choices))))

(defn announce-treasure-location
  [{lat :lat lng :lng}]
  (println (str "Treasure lat: " lat))
  (println (str "Treasure lng: " lng)))

(defn factorial [n]
  (if (= n 0) 1
      (* n (factorial (dec n)))))

(defn fizz-buzz []
  (loop [i 1]
    (if (<= i 100)
      (do
        (cond
         (and (= (rem i 3) 0) (= (rem i 5) 0)) (println "FizzBuzz")
         (= (rem i 3) 0) (println "Fizz")
         (= (rem i 5) 0) (println "Buzz")
         :else (println i))
        (recur (inc i))))))
