# -*- mode: python ; coding: utf-8 -*-


a = Analysis(
    ['cloud.py'],
    pathex=['server-apps', 'handlers'],
    binaries=[],
    datas=[('static', 'static'), ('./oscar/bin/oscar64', 'oscar/bin'), ('./oscar/include', 'oscar/include'), ('./oscar/docs/C_0*.md', 'oscar/docs')],
    hiddenimports=[
        'code_chat_console',
        'coding_agent_console',
        'file_editor_console',
        'rss_reader',
        'telegram_chat',
        'web_browser',
        'wiki_browser',
        'command_handler',
        'shared_state',
        'console_manager',
        'chat_handler',
        'help_handler',
        'python_eval_handler',
        'csdb_handler',
    ],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
    optimize=0,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name='hdnsh-server-linux',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=True,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)
