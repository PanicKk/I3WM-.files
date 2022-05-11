do
    pulseaudio --kill || break
    sleep 5s || break
    pulseaduio --start || break
done
