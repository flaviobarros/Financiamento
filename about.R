function(){
  tabPanel("About",
           HTML('<div style="float: right; margin: 0 5px 5px 10px;"><iframe width="1120" height="0" src="//www.youtube.com/embed/ilZUzn3XUC0" frameborder="0" allowfullscreen></iframe></div>
                
                <p style="text-align:justify">This web application provides a financial calculator as part of 
                 the course "Developing Data Products". The app showcases two of the most used amortizations systems: 
                PRICE (French System) and SAC (Constant Amortization System). You can choose three inputs: Value, Interest and Installment.
                On the first time, a PRICE Table is calculated with defauts. After that you can choose other inputs and click at "SAC" or "PRICE" buttons to calculate new tables.</p>
                
                <p style="text-align:justify">In economics, a price system is a component of any economic system that uses prices expressed in any form of money for the valuation and distribution of goods and services and the factors of production. Except for possible remote and primitive communities, all modern societies use price systems to allocate resources, although price systems are not used exclusively for all resource allocation decisions.[1]
A price system may be either a fixed price system where prices are administered by a government body, or it may be a free price system where prices are left to float "freely" as determined by supply and demand uninhibited by regulations. A mixed price system involves a combination of both administered and unregulated prices.</p>
                
                <p style="text-align:justify">In lending, amortization is the distribution of payment into multiple cash flow installments, as determined by an amortization schedule. Unlike other repayment models, each repayment installment consists of both principal and interest. Amortization is chiefly used in loan repayments (a common example being a mortgage loan) and in sinking funds. Payments are divided into equal amounts for the duration of the loan, making it the simplest repayment model. A greater amount of the payment is applied to interest at the beginning of the amortization schedule, while more money is applied to principal at the end.</p>'),
                
                
           HTML('
                <div style="clear: left;"><img src="http://www.gravatar.com/avatar/" alt="" style="float: left; margin-right:5px" /></div>
                <p>Flavio Barros<br/>
                
                <a href="http://flaviobarros.net" target="_blank">Blog</a> | 
                <a href="https://twitter.com/flaviomargarito" target="_blank">Twitter</a> | 
                <a href="https://www.linkedin.com/in/flaviommbarros" target="_blank">Linkedin</a> <br/>
                </p>'),
           
           fluidRow(
             column(12,
                    br(),
                    br(),
                    br(),
                    strong('Related blog posts'),
                    p(HTML('<ul>'),
                      HTML('<li>'),a("Share your Shiny Apps with Docker and Kitematic!", href="http://www.flaviobarros.net/2015/08/10/share-your-shiny-apps-with-docker-and-kitematic/", target="_blank"),HTML('</li>'),
                      HTML('<li>'),a("Git pushing Shiny Apps with Docker & Dokku", href="http://www.flaviobarros.net/2015/05/11/git-pushing-shiny-apps-with-docker-dokku/", target="_blank"),HTML('</li>'),
                      HTML('<li>'),a("Dockerizing a Shiny App", href="http://www.flaviobarros.net/2015/04/30/dockerizing-a-shiny-app/", target="_blank"),HTML('</li>'),
                      HTML('</ul>')),
                    br(),
                    strong('References'),
                    p(HTML('<ul>'),
                      HTML('<li>'),a('Coded in R', href="http://www.r-project.org/", target="_blank"),HTML('</li>'),
                      HTML('<li>'),a('Built with the Shiny package', href="http://www.rstudio.com/shiny/", target="_blank"),HTML('</li>'),
                      HTML('<li>'),"Additional supporting R packages",HTML('</li>'),
                      HTML('<ul>'),
                      HTML('<li>'),a('reshape2', href="http://cran.r-project.org/web/packages/reshape2/index.html", target="_blank"),HTML('</li>'),
                      HTML('<li>'),a('ggplot2', href="http://cran.r-project.org/web/packages/ggplot2/index.html", target="_blank"),HTML('</li>'),
                      HTML('<ul>'),
                      HTML('</ul>'))
             ),
             column(12
                    
             )
           ),
           value="about"
           )
}