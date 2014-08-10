clearinghoused Build System (clearinghoused_build)
==================================================

`clearinghoused_build <https://github.com/ClearingHouse/clearinghoused_build>`__ is the automated build system for
`clearinghoused <https://github.com/ClearingHouse/clearinghoused>`__. This is an alternative method from
`manual clearinghoused installation and running <https://github.com/Clearinghouse/clearinghoused/blob/master/README.md>`__,
which includes a point-and-click Windows installer, as well as a source code build script that takes care of
all setup necessary to run ``clearinghoused`` from source.

**Using the build system, you have the following options:**

- If you are a **Windows user**, you can either :doc:`use the installer package <UsingTheInstaller>`, or
  :doc:`build from source <BuildingFromSource>`
- If you are an **Ubuntu Linux user**, you can :doc:`use the build system to automate your
  install/setup from source <BuildingFromSource>`
- If you are **neither**, at this point you will need to follow `the manual installation instructions <https://github.com/ClearingHouse/clearinghoused/blob/master/README.md>`__.


When to use?
------------------

This build system will probably be especially helpful in any of the following circumstances:

- You are a Windows user, or a Linux user that isn't super experienced with the command line interface.
- You want to deploy ``clearinghoused`` in a production environment, and have it run automatically on system startup
- You want to build your own ``clearinghoused`` binaries

Future plans
------------------

Future plans for the build system (*pull requests for these features would be greatly appreciated*):

- Add support for Linux distributions beyond Ubuntu Linux
- Add support for Mac OS X automated setup from source
- Add support for creation of installer for Mac OS X
- Add support for creation of ``.rpm``, ``.deb.``, etc. binary packages for Linux

More information on Clearinghouse is available in the `specs <https://github.com/ClearingHouse/Clearinghouse>`__.


Table of Contents
------------------

.. note::

    Documentation on the ``clearinghoused`` API exists at `http://clearinghoused.rtfd.org <http://clearinghoused.rtfd.org>`__.


.. toctree::
   :maxdepth: 3

   SettingUpViacoind
   UsingTheInstaller
   BuildingFromSource
   AdditionalTopics
   SettingUpInsight
   SettingUpAFederatedNode


Indices and tables
------------------

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

