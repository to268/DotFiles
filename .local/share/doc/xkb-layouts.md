# Add a custom keymap

Add it to you systems keyboard and restart your computer.

```
cat true-dvorak >> /usr/share/X11/xkb/symbols/us
```

Then you have to update the file `/usr/share/X11/xkb/rules/evdev.xml` with the following, add it near the other English keyboards


```
<variant>
    <configItem>
        <name>true-dvorak</name>
        <description>English (True Dvorak)</description>
        <vendor>to268</vendor>
    </configItem>
</variant>
```
