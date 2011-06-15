Jenkins Github Hook
===================

A simple sinatra app to relay Github post receive hook notifications on
to Jenkins to trigger a new build. I built this because Jenkins was
triggering a new build everytime something is checked in on any branch. 

This uses a tiny bit of logic to decide if the referenced commit relates
to a branch we're interested in building, and if so, sends a post on to
the jenkins build server.

This most probably would have been best written as a Jenkins plugin, but
I know Ruby best so this was quickest for me.
