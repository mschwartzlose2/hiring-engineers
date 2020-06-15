Prerequisites 

**I created a VMWare VM with CentOS v7.6
Installed mongodb, python3, flask, python-virtualenv, ddtrace and a number of supporting packages******

Collecting Metrics:

    Add tags in the Agent config file and show us a screenshot of your host and its tags on the Host Map page in Datadog.
    Install a database on your machine (MongoDB, MySQL, or PostgreSQL) and then install the respective Datadog integration for that database.
    Create a custom Agent check that submits a metric named my_metric with a random value between 0 and 1000.
    Change your check's collection interval so that it only submits the metric once every 45 seconds.

**I installed that Datadog agent using:
DD_AGENT_MAJOR_VERSION=7 DD_API_KEY=215f1779e61ab8eb3ec19085d06a3f97 bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh)"**

**Added tags to agent config datadog.yaml:
tags: ["db:mongo", "dev:phx", "os:linux", "contact:mark"]**
(https://github.com/mschwartzlose2/hiring-engineers/blob/master/tags.jpg)

**Created  /etc/datadog-agent/conf.d/mongo.d/conf.yaml to monitor mongodb.**
[https://github.com/mschwartzlose2/hiring-engineers/blob/master/mongo_conf.yaml](https://github.com/mschwartzlose2/hiring-engineers/blob/master/mongo_conf.yaml)

**Tags are extremely powerful in helping associate devices, applications, hosts etc... to services, departments, division, groups etc...  This makes dashboarding, alert prioritization association and assignment much easier and allows quick assignment to the right resources for resolution.** 


**Created random number generator and custom Agent check:**
[https://github.com/mschwartzlose2/hiring-engineers/blob/master/randomnumber.py](https://github.com/mschwartzlose2/hiring-engineers/blob/master/randomnumber.py)

**Changed collection interval to 45 seconds.**
[https://github.com/mschwartzlose2/hiring-engineers/blob/master/randomnumber.yaml](https://github.com/mschwartzlose2/hiring-engineers/blob/master/randomnumber.yaml)


    Bonus Question Can you change the collection interval without modifying the Python check file you created?
**Yes, in the yaml file as above.**

Visualizing Data:

Utilize the Datadog API to create a Timeboard that contains:

    Your custom metric scoped over your host.
    Any metric from the Integration on your Database with the anomaly function applied.
    Your custom metric with the rollup function applied to sum up all the points for the past hour into one bucket

Please be sure, when submitting your hiring challenge, to include the script that you've used to create this Timeboard.

**I used curl:**
[https://github.com/mschwartzlose2/hiring-engineers/blob/master/createdash.sh](https://github.com/mschwartzlose2/hiring-engineers/blob/master/createdash.sh)

Once this is created, access the Dashboard from your Dashboard List in the UI:

    Set the Timeboard's timeframe to the past 5 minutes
    Take a snapshot of this graph and use the @ notation to send it to yourself.
    [https://github.com/mschwartzlose2/hiring-engineers/blob/master/my_metric_over_5_min.jpg](https://github.com/mschwartzlose2/hiring-engineers/blob/master/my_metric_over_5_min.jpg)
    [https://github.com/mschwartzlose2/hiring-engineers/blob/master/sentusing_at.jpg](https://github.com/mschwartzlose2/hiring-engineers/blob/master/sentusing_at.jpg)
![](https://github.com/mschwartzlose2/hiring-engineers/blob/master/my_metric_over_5_min.jpg)
![](https://github.com/mschwartzlose2/hiring-engineers/blob/master/sentusing_at.jpg)

    Bonus Question: What is the Anomaly graph displaying?
**Mine does not show anything really because there isn't much if any use of the app or host.  Anomaly graphs are used to show deviation from normal patterns of behavior.  Very simple example is a CPU that from eight to five each week day runs between 30% and 55%.  This is normal operation, but if the CPU deviated outside that normal pattern you could see it on the graph as the monitored metric deviates outside the normal channel on the graph.  This deviation can also trigger an alert notification.**

Monitoring Data

Since you’ve already caught your test metric going above 800 once, you don’t want to have to continually watch this dashboard to be alerted when it goes above 800 again. So let’s make life easier by creating a monitor.

Create a new Metric Monitor that watches the average of your custom metric (my_metric) and will alert if it’s above the following values over the past 5 minutes:

    Warning threshold of 500
    Alerting threshold of 800
    And also ensure that it will notify you if there is No Data for this query over the past 10m.

**Screenshot:**
[https://github.com/mschwartzlose2/hiring-engineers/blob/master/alert_conditions.jpg](https://github.com/mschwartzlose2/hiring-engineers/blob/master/alert_conditions.jpg)
![](https://github.com/mschwartzlose2/hiring-engineers/blob/master/alert_conditions.jpg)


Please configure the monitor’s message so that it will:

    Send you an email whenever the monitor triggers.

    Create different messages based on whether the monitor is in an Alert, Warning, or No Data state.

    Include the metric value that caused the monitor to trigger and host ip when the Monitor triggers an Alert state.

    When this monitor sends you an email notification, take a screenshot of the email that it sends you.
    
    **Screenshots:**
    [https://github.com/mschwartzlose2/hiring-engineers/blob/master/say_whats_happening.jpg](https://github.com/mschwartzlose2/hiring-engineers/blob/master/say_whats_happening.jpg)
    
    ![](https://github.com/mschwartzlose2/hiring-engineers/blob/master/say_whats_happening.jpg)
    
    [https://github.com/mschwartzlose2/hiring-engineers/blob/master/trigered_alert_email.jpg](https://github.com/mschwartzlose2/hiring-engineers/blob/master/trigered_alert_email.jpg)
    ![](https://github.com/mschwartzlose2/hiring-engineers/blob/master/trigered_alert_email.jpg)
    
    Bonus Question: Since this monitor is going to alert pretty often, you don’t want to be alerted when you are out of the office. Set up two scheduled downtimes for this monitor:
        One that silences it from 7pm to 9am daily on M-F,
        And one that silences it all day on Sat-Sun.
        Make sure that your email is notified when you schedule the downtime and take a screenshot of that notification.

[https://github.com/mschwartzlose2/hiring-engineers/blob/master/weekend_downtime_email.jpg](https://github.com/mschwartzlose2/hiring-engineers/blob/master/weekend_downtime_email.jpg)

![](https://github.com/mschwartzlose2/hiring-engineers/blob/master/weekend_downtime_email.jpg)


Collecting APM Data:

Given the following Flask app (or any Python/Ruby/Go app of your choice) instrument this using Datadog’s APM solution:


    Note: Using both ddtrace-run and manually inserting the Middleware has been known to cause issues. Please only use one or the other.

    Bonus Question: What is the difference between a Service and a Resource?

Provide a link and a screenshot of a Dashboard with both APM and Infrastructure Metrics.

[https://app.datadoghq.com/dashboard/xet-9wz-aa4/marks-timeboard-15-jun-2020-0728?from_ts=1592240958883&to_ts=1592244558883&live=true](https://app.datadoghq.com/dashboard/xet-9wz-aa4/marks-timeboard-15-jun-2020-0728?from_ts=1592240958883&to_ts=1592244558883&live=true)
[https://github.com/mschwartzlose2/hiring-engineers/blob/master/apmdash.jpg](https://github.com/mschwartzlose2/hiring-engineers/blob/master/apmdash.jpg)

![](https://github.com/mschwartzlose2/hiring-engineers/blob/master/apmdash.jpg)

Please include your fully instrumented app in your submission, as well.

**I used ddtrace-run: ddtrace-run python3 flasky.py**

[flasky.py](https://github.com/mschwartzlose2/hiring-engineers/blob/master/flasky.py)

Final Question:

Datadog has been used in a lot of creative ways in the past. We’ve written some blog posts about using Datadog to monitor the NYC Subway System, Pokemon Go, and even office restroom availability!

Is there anything creative you would use Datadog for?

**Yes the ferry system in the Seattle area tends to run late even in good weather.  I would like to be notified when the normal pattern for the two routes that I use are running outside of their usual late pattern.  Anomaly analysis would be great for this.  That would allow me to reduce the time I spend waiting to get on the ferry and give me more productive time.**


**Some of the docs, searches and commands used:**
https://docs.datadoghq.com/agent/basic_agent_usage/centos/?tab=agentv6v7
https://docs.datadoghq.com/tracing/setup/python/
https://app.datadoghq.com/apm/docs?architecture=host-based&language=python
https://docs.datadoghq.com/agent/troubleshooting/agent_check_status/?tab=agentv6v7#linux
https://docs.datadoghq.com/developers/write_agent_check/?tab=agentv6v7
https://coderwall.com/p/s2ttyg/random-number-generator-in-bash
https://docs.datadoghq.com/api/v1/dashboards/#create-a-new-dashboard
https://www.tutorialspoint.com/mongodb/index.htm
https://docs.datadoghq.com/dashboards/guide/custom_time_frames/
http://pypi.datadoghq.com/trace/docs/db_integrations.html#flask-cache
https://stackoverflow.com/questions/21530577/fatal-error-python-h-no-such-file-or-directory
https://docs.datadoghq.com/tracing/guide/setting_primary_tags_to_scope/
sudo service datadog-agent status
sudo -u dd-agent -- datadog-agent check randomnumber
sudo service datadog-agent start
sudo service datadog-agent stop
sudo service datadog-agent restart



Instructions

If you have a question, create an issue in this repository.

To submit your answers:

    Fork this repo.
    Answer the questions in answers.md
    Commit as much code as you need to support your answers.
    Submit a pull request.
    Don't forget to include links to your dashboard(s), even better links and screenshots. We recommend that you include your screenshots inline with your answers.

