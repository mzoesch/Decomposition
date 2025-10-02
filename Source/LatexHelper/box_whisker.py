import numpy as np


def _whisker(data):
    arr = np.array(data)
    return (
        float(np.min(arr)),             # Min
        float(np.percentile(arr, 25)),  # Q1
        float(np.median(arr)),          # Median
        float(np.percentile(arr, 75)),  # Q3
        float(np.max(arr))              # Max
    )


def whisker(exotics, vanilla):
    return [w - 1.0 for w in _whisker([exotic / np.mean(vanilla) for exotic in exotics])]


def pretty_mean(display, analysis, split, vanilla):
    print(
        display,
        np.mean(analysis),
        np.mean(split),
        np.mean(vanilla),
        np.mean([a + b for a, b in zip(analysis, split)]),
        np.mean([ovhd - 1.0 for ovhd in [e / np.mean(vanilla) for e in analysis]]),
        np.mean([ovhd - 1.0 for ovhd in [e / np.mean(vanilla) for e in [a + b for a, b in zip(analysis, split)]]])
        )


bzip2 = [14.31, 11.92, 12.68, 11.81, 13.79, 13.58, 11.79, 12.19, 13.91, 12.15]
bzip2_split = [0.14, 0.14, 0.14, 0.19, 0.15, 0.15, 0.14, 0.71, 0.14, 0.16]
bzip2_vanilla = [14.27, 11.54, 11.59, 10.99, 10.42]

libyaml = [3.42, 5.27, 5.38, 5.29, 4.82, 4.79, 4.84, 5.17, 5.41, 4.72]
libyaml_split = [0.43, 0.44, 0.41, 0.42, 0.40, 0.46, 0.45, 0.44, 0.49, 0.44]
libyaml_vanilla = [3.42, 1.61, 1.70, 2.32, 2.96]

zlib = [3.68, 4.50, 4.60, 4.75, 4.78, 4.83, 5.11, 4.42, 5.03, 5.13]
zlib_split = [0.38, 0.40, 0.51, 0.65, 0.43, 0.40, 0.37, 0.30, 0.38, 0.39]
zlib_vanilla = [3.68, 2.75, 2.59, 3.23, 2.75]

libuv = [17.55, 16.93, 16.30, 17.00, 16.60, 16.99, 16.84, 16.60, 15.53, 16.10]
libuv_split = [2.68, 2.17, 2.04, 2.06, 2.21, 2.04, 2.07, 2.03, 2.08, 2.03]
libuv_vanilla = [7.76, 7.15, 7.12, 7.24, 7.43]

miniaudio = [32.76, 32.27, 31.16, 31.36, 31.40]
miniaudio_split = [61.96, 62.73, 61.17, 61.14, 62.34]
miniaudio_vanilla = [2.76, 7.92, 3.48, 2.94, 3.21]

glfw = [19.63, 18.91, 19.95, 18.58, 19.72, 20.49, 20.86, 18.96, 19.44, 19.75]
glfw_split = [6.09, 5.33, 5.79, 5.38, 5.40, 8.53, 5.68, 5.60, 5.63, 5.70]
glfw_vanilla = [6.03, 6.34, 6.33, 6.31, 6.36]

libpng = [8.80, 11.14, 9.52, 9.93, 9.95, 10.23, 9.57, 9.87, 10.51, 10.61]
libpng_split = [3.10, 2.73, 2.91, 3.08, 2.99, 2.77, 3.06, 2.56, 2.54, 3.10]
libpng_vanilla = [3.25, 3.66, 3.67, 3.70, 3.65]

lwipcore = [61.84, 63.27, 62.71, 61.57, 63.12, 60.70, 61.64, 60.86, 60.81, 63.20]
lwipcore_split = [30.76, 28.99, 29.69, 28.98, 30.82, 29.11, 29.05, 28.83, 30.21, 29.25]
lwipcore_vanilla = [14.76, 12.25, 12.50, 12.37, 13.48]

freetype = [96.66, 103.13, 101.70, 98.75, 102.21, 100.28, 100.74, 98.26, 96.41, 95.19]
freetype_split = [103.26, 106.18, 100.50, 104.89, 102.99, 105.05, 104.89, 105.15, 103.67, 103.11]
freetype_vanilla = [26.77, 23.42, 28.51, 24.78, 26.32]

sql3amag = [42.05, 41.24, 43.70, 44.78, 42.74]
sql3amag_split = [214.79, 204.96, 207.75, 211.93, 206.66]
sql3amag_vanilla = [3.77, 3.79, 3.78, 3.82, 3.79]

curl = [160.21, 162.40, 159.53, 151.88, 157.27, 153.11, 157.47, 157.61, 152.59, 161.22]
curl_split = [75.75, 73.58, 75.33, 74.45, 74.45, 74.94, 77.82, 78.32, 78.81, 77.55, 72.81]
curl_vanilla = [44.33, 44.64, 44.51, 45.39, 44.99]

sqlite3 = [148.58, 144.92, 147.33, 135.73, 144.88, 133.36, 141.58, 136.10, 147.98, 141.20]
sqlite3_split = [317.41, 290.66, 290.76, 290.37, 292.78, 292.38, 305.20, 304.95, 310.41, 286.76]
sqlite3_vanilla = [43.63, 42.62, 45.21, 44.28, 44.12]

print('# Box and Whisker Data (relative to vanilla)')
print('bzip2', whisker(bzip2, bzip2_vanilla))
print('libyaml', whisker(libyaml, libyaml_vanilla))
print('zlib', whisker(zlib, zlib_vanilla))
print('libuv', whisker(libuv, libuv_vanilla))
print('miniaudio', whisker(miniaudio, miniaudio_vanilla))
print('glfw', whisker(glfw, glfw_vanilla))
print('libpng', whisker(libpng, libpng_vanilla))
print('lwipcore', whisker(lwipcore, lwipcore_vanilla))
print('freetype', whisker(freetype, freetype_vanilla))
print('sql3amag', whisker(sql3amag, sql3amag_vanilla))
print('curl', whisker(curl, curl_vanilla))
print('sqlite3', whisker(sqlite3, sqlite3_vanilla))

print('# Total Box and Whisker Data (relative to vanilla)')
print('bzip2', whisker([a + b for a, b in zip(bzip2, bzip2_split)], bzip2_vanilla))
print('libyaml', whisker([a + b for a, b in zip(libyaml, libyaml_split)], libyaml_vanilla))
print('zlib', whisker([a + b for a, b in zip(zlib, zlib_split)], zlib_vanilla))
print('libuv', whisker([a + b for a, b in zip(libuv, libuv_split)], libuv_vanilla))
print('miniaudio', whisker([a + b for a, b in zip(miniaudio, miniaudio_split)], miniaudio_vanilla))
print('glfw', whisker([a + b for a, b in zip(glfw, glfw_split)], glfw_vanilla))
print('libpng', whisker([a + b for a, b in zip(libpng, libpng_split)], libpng_vanilla))
print('lwipcore', whisker([a + b for a, b in zip(lwipcore, lwipcore_split)], lwipcore_vanilla))
print('freetype', whisker([a + b for a, b in zip(freetype, freetype_split)], freetype_vanilla))
print('sql3amag', whisker([a + b for a, b in zip(sql3amag, sql3amag_split)], sql3amag_vanilla))
print('curl', whisker([a + b for a, b in zip(curl, curl_split)], curl_vanilla))
print('sqlite3', whisker([a + b for a, b in zip(sqlite3, sqlite3_split)], sqlite3_vanilla))

print('# Means (analysis, split, vanilla, total, ovhd, total ovhd)')
pretty_mean('bzip2', bzip2, bzip2_split, bzip2_vanilla)
pretty_mean('libyaml', libyaml, libyaml_split, libyaml_vanilla)
pretty_mean('zlib', zlib, zlib_split, zlib_vanilla)
pretty_mean('libuv', libuv, libuv_split, libuv_vanilla)
pretty_mean('miniaudio', miniaudio, miniaudio_split, miniaudio_vanilla)
pretty_mean('glfw', glfw, glfw_split, glfw_vanilla)
pretty_mean('libpng', libpng, libpng_split, libpng_vanilla)
pretty_mean('lwipcore', lwipcore, lwipcore_split, lwipcore_vanilla)
pretty_mean('freetype', freetype, freetype_split, freetype_vanilla)
pretty_mean('sql3amag', sql3amag, sql3amag_split, sql3amag_vanilla)
pretty_mean('curl', curl, curl_split, curl_vanilla)
pretty_mean('sqlite3', sqlite3, sqlite3_split, sqlite3_vanilla)
