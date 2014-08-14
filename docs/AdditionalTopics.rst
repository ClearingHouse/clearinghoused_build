ViacoinTest Additional Topics
======================

This section contains some tidbits of info that you may find useful when working with ``clearinghoused``.

For a good overview of what you can do with ``clearinghoused``, see `this link <https://github.com/ClearingHouse/clearinghoused#usage>`__.

Finding the Data Directory
---------------------------

``clearinghoused`` stores its configuration, logging, and state data in a place known as the ``clearinghoused``
data directory.

Under Linux, the data directory is normally located in ``~/.config/clearinghoused`` (when
``clearinghoused`` is installed normally, via the ``setup.py`` installer).

Under Windows, the data directory is normally located at ``%APPDATA%\ClearingHouse\clearinghoused``. Examples of this are:

- ``C:\Users\<your username>\AppData\Roaming\ClearingHouse\clearinghoused`` (Windows 7/8/Server)
- ``C:\Documents and Settings\<your username>\Application Data\ClearingHouse\clearinghoused`` (Windows XP)


Editing the Config
---------------------------

``clearinghoused`` can read its configuration data from a file. The build system uses this method to allow for 
automated startup of ``clearinghoused``.

If using the Windows installer, a configuration file will be automatically created for you from data gathered
via the installation wizard.

If not using the Windows installer, the ``setup.py`` script will create a basic ``clearinghoused.conf`` file for you that contains
options that tell ``clearinghoused`` where and how to connect to your ``viacoind`` process. Here's an example of the default file created::

    [Default]
    viacoind-rpc-connect=localhost
    viacoind-rpc-port=5222
    viacoind-rpc-user=rpc
    viacoind-rpc-password=rpcpw1234
    rpc-user=my_api_user
    rpc-password=my_api_password

After running the ``setup.py`` script to create this file, you'll probably need to edit it and tweak the settings
to match your exact ``viacoind`` configuration (e.g. especially ``rpc-password``). Note that the above config
connects to ``viacoind`` on mainnet (port 5222).

Note that also, with the config above, it will set up ``clearinghoused`` to listen on localhost (127.0.0.1)
on port 7300 (if on mainnet) or port 17300 (if on testnet) for API connections (these are the default ports,
and can be changed by specifying the ``rpc-host`` and/or ``rpc-port`` parameters).


Viewing the Logs
-----------------

By default, ``clearinghoused`` logs data to a file named ``clearinghoused.log``, located within the ``clearinghoused``
data directory.

Under Linux, you can monitor these logs via a command like ``tail -f ~/.config/clearinghoused/clearinghouse.log``.

Under Windows, you can use a tool like `Notepad++ <http://notepad-plus-plus.org/>`__ to view the log file,
which will detect changes to the file and update if necessary.

Running clearinghoused on testnet
--------------------------------

Here's the steps you'll need to take to set up an additional viacoind on testnet for ``clearinghoused`` testing. 
This assumes that you're already running ``viacoind`` (or ``viacoin-qt``) on mainnet, and would like to set up a
second instance for testnet:

Windows
~~~~~~~~

First, find your current ``viacoind`` data directory, which is normally located at ``%APPDATA%\Viacoin``. Examples of this are:

- ``C:\Users\<your username>\AppData\Roaming\Viacoin`` (Windows 7/8/Server)
- ``C:\Documents and Settings\<your username>\Application Data\Viacoin`` (Windows XP)

Alongside that directory (e.g. at the root of your AppData\Roaming dir), create another directory, name it something
like ``ViacoinTest``.

- ``C:\Users\<your username>\AppData\Roaming\ViacoinTest`` (Windows 7/8/Server)
- ``C:\Documents and Settings\<your username>\Application Data\ViacoinTest`` (Windows XP)
 
In this ``ViacoinTest`` directory, create a ``viacoin.conf`` file with the following contents::

    rpcuser=rpc
    rpcpassword=rpcpw1234
    server=1
    daemon=1
    txindex=1
    testnet=1

Now, make a shortcut to something like the following (assuming you installed to the default
install directory from the .exe installer):

To run ``viacoin-qt``: ``"C:\Program Files (x86)\Viacoin\viacoin-qt.exe" --datadir="C:\Users\<your username\AppData\Roaming\ViacoinTest"``
To run ``viacoind``: ``"C:\Program Files (x86)\Viacoin\viacoind.exe" --datadir="C:\Users\<your username>\AppData\Roaming\ViacoinTest"``

Note that you can run either. If you want the GUI, run viacoin-qt (which will also listen on the RPC interface).
If you are comfortable using ``viacoind`` commands (or are using a server), just run ``viacoind``.

Then, just launch that shortcut. (Or, if you are having problems, you can just open up a command window and
try running that directly.)

Once launched, ``viacoind``/``viacoin-qt`` will be listening on testnet RPC API port ``18332``. You can just
run ``clearinghoused`` with its ``--datadir`` parameter to point to a directory with its own
``clearinghoused.conf`` file that has the connection parameters to your testnet viacoin daemon that's now running.

This means, that like with ``viacoind``, you may have two separate ``clearinghoused`` data directories, each with
their own configuration file and database. The difference
between the configuration files in each datadir will be that the one for your "testnet" ``clearinghoused`` will simply
specify ``rpc-port=18332``, while the one for your "mainnet" ``clearinghoused`` will specify ``rpc-port=8332``.


Linux
~~~~~~

Similar to the above, create a second viacoin data directory (maybe name it ``.viacoin-test``, instead of ``.viacoin``). Place
it alongside your main ``.viacoin`` directory (e.g. under ``~``). In this directory, create a ``viacoin.conf``
file with the same contents as in the above Windows section.

Now, run ``viacoind`` or ``viacoin-qt``, as such:

To run ``viacoin-qt``: ``"viacoin-qt --datadir=~/.viacoin-test``
To run ``viacoind``: ``viacoind --data-dir=~/.viacoin-test``

For more information, see the Windows section above.


Next Steps
-----------

Once ``clearinghoused`` is installed and running, you can start running ``clearinghoused`` commands directly,
or explore the (soon to exist) built-in API via the documentation at the `main clearinghoused repository <https://github.com/ClearingHouse/clearinghoused>`__.
