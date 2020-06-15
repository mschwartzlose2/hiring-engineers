# the following try/except block will make the custom check compatible with any Agent version
#try:
#    # first, try to import the base class from new versions of the Agent...
#    from datadog_checks.base import AgentCheck
#except ImportError:
#    # ...if the above failed, the check is running in Agent version < 6.6.0
#    from checks import AgentCheck
#
# content of the special variable __version__ will be shown in the Agent status page
#__version__ = "1.0.0"
#
#class HelloCheck(AgentCheck):
#    def check(self, instance):
#        self.gauge('hello.world', 1, tags=['TAG_KEY:TAG_VALUE'])
#
#
try:
    # first, try to import the base class from new versions of the Agent...
    from datadog_checks.base import AgentCheck
except ImportError:
    # ...if the above failed, the check is running in Agent version < 6.6.0
    from checks import AgentCheck

# content of the special variable __version__ will be shown in the Agent status page
#

__version__ = "1.0.3"

from datadog_checks.checks import AgentCheck
from random import randint
class Check(AgentCheck):
    def check(self, instance):
        self.gauge('my_metric', randint(0,1000))