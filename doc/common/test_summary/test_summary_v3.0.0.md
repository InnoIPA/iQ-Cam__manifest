# iQ-Cam camera test summary — driver v3.0.0

Cross-module summary of the iQ-Cam camera test suite for driver v3.0.0: one result column per camera module, taken from the newest test run of that module. Test items are aligned by case id, so the same test item is on the same row for every module.

Legend: ✅ pass · ❌ fail (or the case could not run) · ❌¹ fail, known limitation (expected result, see Known limitations) · ⚠️ warn (only soft checks failed) · ⏭️ skip (prerequisite absent) · — no result for this module

| No. | Test Item | Goal | Approach | Program | EV2M-OOM3 | EV3F-ZSM1-PP19 | EV3F-ZSM1-PP19-FS | EV8M-OOM1 | EVDF-OOM1-PP19 | EVDF-OOM1-PP19-FS | EVDM-OOM1 |
|---:|---|---|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 1 | Environment & deployment sanity | Installed driver matches the release tarball and the runtime prerequisites are present | Compare installed .bin md5 with the tarball; check the CamX override, cam-server, GStreamer elements and V4L2 nodes | adb, md5sum, gst-inspect-1.0 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| 2 | Sensor probe & enumeration | All expected sensors probe and cam-server enumerates them | Restart cam-server, count kernel "Probe success" lines, read "Number of cameras", record the camera map | cam-server, dmesg, journalctl | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| 3 | Single-camera still capture | Every camera delivers a valid still at native resolution | One capture per camera on a fresh cam-server; validate PNG dimensions, size and luma | gst-launch-1.0 qtiqmmfsrc ! pngenc | ✅ | ✅ | ❌¹ | ✅ | ✅ | ❌¹ | ✅ |
| 4 | Preview streaming stability & FPS | Sustained preview runs cleanly at the nominal frame rate | Stream camera 0 for 60 s; require no gst errors and an average of at least 27 fps | gst-launch-1.0 qtiqmmfsrc ! fpsdisplaysink | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| 5 | Multi-camera concurrent streaming | All cameras stream at the same time | GMSL: all 8 links through the per-port sample app; MIPI: one gst-launch per camera in parallel; verdict per delivered PNG | gst-camera-per-port-example (GMSL); parallel gst-launch-1.0 (MIPI) | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| 6 | H.264 video recording | Hardware H.264 encode produces a playable MP4 | Record 10 s with v4l2h264enc into mp4mux; check moov/mdat, duration and the H.264 stream with gst-discoverer | gst-launch-1.0 qtiqmmfsrc ! v4l2h264enc ! h264parse ! mp4mux | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |

## Known limitations

The marked results are expected and accepted; they are not driver defects. They keep their symbol in the table and are still counted in Runs used, so the raw result stays visible.

1. **Frame-sync (-FS) modules: single-camera still capture** — test #3 Single-camera still capture: EV3F-ZSM1-PP19-FS, EVDF-OOM1-PP19-FS
   - Frame sync is only meaningful when several cameras stream together, so a single-camera capture failing on an -FS module does not affect the module's intended multi-camera use.
   - When a single camera is needed, use the non-FS variant of the same module (the same module name without the -FS suffix).

## Runs used

The run column is the timestamp prefix of the test-run directory each module column was taken from.

| Module | Run | Date | Driver | Cases |
|---|---|---|---|---|
| EV2M-OOM3 | 20260917_161832 | 2026-09-17 16:18:32 | v3.0.0 | 6 pass |
| EV3F-ZSM1-PP19 | 20260916_165853 | 2026-09-16 16:58:53 | v3.0.0 | 6 pass |
| EV3F-ZSM1-PP19-FS | 20260923_082039 | 2026-09-23 08:20:39 | v3.0.0 | 5 pass, 1 fail (1 known limitation) |
| EV8M-OOM1 | 20260917_160702 | 2026-09-17 16:07:02 | v3.0.0 | 6 pass |
| EVDF-OOM1-PP19 | 20260917_150303 | 2026-09-17 15:03:03 | v3.0.0 | 6 pass |
| EVDF-OOM1-PP19-FS | 20260918_142105 | 2026-09-18 14:21:05 | v3.0.0 | 5 pass, 1 fail (1 known limitation) |
| EVDM-OOM1 | 20260917_163255 | 2026-09-17 16:32:55 | v3.0.0 | 6 pass |

_Generated 2026-09-29 14:43._
