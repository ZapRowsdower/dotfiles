/**
 * Music Ideas:
 * - https://news.ycombinator.com/item?id=3547694",
 * - https://news.ycombinator.com/item?id=3605957",
 * - https://news.ycombinator.com/item?id=12844434",
 * - https://news.ycombinator.com/item?id=21771600",
 * - https://news.ycombinator.com/item?id=27737887",
 * - https://news.ycombinator.com/item?id=32009440
 */

import { spawn } from 'node:child_process';
const links = ["https://open.spotify.com/artist/45g23Apmqo2x4obM7LjmpW",
	"https://uazu.net/sbagen/",
	"https://www.youtube.com/watch?v=ZXtimhT-ff4",
	"https://www.electronicbeats.net/the-feed/relax-with-over-99-hours-of-ambient-noise-from-sci-fi-films/",
	"https://www.vipvgm.net/",
	"https://www.youtube.com/watch?v=VUYdoyFlGe8",
	"https://open.spotify.com/playlist/08MHNuaL6yU9oeSeK2qg8x?si=a2d2194eea8a49e7",
	"https://open.spotify.com/playlist/3Fa5SKA1FVUSodtndYqNsn?si=f23d0b417dc24a5f",
	"https://open.spotify.com/embed/playlist/75DHV3ljSZdGdxzDbbYjmY",
	"https://www.youtube.com/watch?v=Y9q6RYg2Pdg",
	"https://open.spotify.com/playlist/0gLnq5MERpg58hMfpSqVWr",
	"https://imgur.com/a/hi0OW",
	"https://www.youtube.com/watch?v=7ldYxgJQG_E",
	"https://www.youtube.com/watch?v=JQmvPQ0MmiY",
	"https://www.0edit.com/",
	"https://open.spotify.com/playlist/2ceXFEO7blxDBa5uhgazyf?si=oBYKDdcdT0ioaH0eiFawlA",
	"https://www.youtube.com/watch?v=QliQ0livbeQ",
	"https://www.youtube.com/watch?v=KUn9SYdPF4A",
	"https://www.youtube.com/watch?v=qBeWuBBG0gw",
	"https://soundcloud.com/rickyryan",
	"https://open.spotify.com/playlist/5YpeoHyEHG7ttNgvzAkW72?si=283f664b91a24278",
	"https://www.youtube.com/c/Meisio",
	"https://rainwave.cc",
	"https://www.youtube.com/watch?v=xiGKxCAg_0o&list=PL0B80EA34DA09E5C4",
	"https://rainymood.com/",
	"https://everynoise.com/",
	"https://www.youtube.com/watch?v=JpCuvaDdzgw",
	"https://www.lofi.cafe/",
	"https://open.spotify.com/playlist/36bPEqDdU1jZiQ9Ix6cM1c?si=d93c1a538f484fe6",
	"https://www.brain.fm/",
	"https://telefon-tel-aviv.bandcamp.com/album/fahrenheit-fair-enough",
	"https://www.youtube.com/c/BlueTurtle",
	"https://datassette.bandcamp.com/",
	"https://www.mixcloud.com/Resonance/near-mint-8th-march-2016-datashat-business-funk-special/",
	"https://music.youtube.com/playlist?list=RDCLAK5uy_mhouxvxL06M5D8E0CzwNeSZ31zZC4WVuA",
	"https://www.di.fm/ambient",
	"https://soundcloud.com/moodindigo72",
	"https://www.youtube.com/watch?v=JZtrD2z5RDo",
	"https://open.spotify.com/playlist/6UScdOAlqXqWTOmXFgQhFA?si=u5oMoQeWRdqZwgK18X3DHA",
	"https://di.fm/",
	"https://wfh.dj",
	"https://wfh.dj/c/UCJOtExbMu0RqIdiE4nMUPxQ/The-Lot-Radio",
	"https://wfh.dj/c/UCHdHhZ5o5iaqkHwcKh7_Kgw/Collect-Radio",
	"https://wfh.dj/c/UC5iaq-e3eigtnXm-x0eU3Mw/Djoon",
	"https://wfh.dj/c/UCaNd66xUJjX8VZT6AByVpiw/Underrated-Albums",
	"https://wfh.dj/c/UCal_TyiLk79vN9-OzEzUM6A/Kiosk-Radio",
	"https://wfh.dj/c/UC8TZwtZ17WKFJSmwTZQpBTA/My-Analog-Journal",
	"https://open.spotify.com/playlist/0tLvg6WcRMc8bn8McRfruK?si=31500a33aa754573",
	"https://open.spotify.com/playlist/77rLJZoIo7VYjrHWk2gKc7?si=12d2b110c2a04a5f",
	"https://open.spotify.com/playlist/6DWXAfI1IPtzIVTXcBd1bU?si=ef12e9eb39324c2e",
	"https://www.youtube.com/watch?v=-6WNB9JN_2o",
	"https://www.youtube.com/c/Macroblank",
	"https://www.youtube.com/c/WhenDubsCry/videos",
	"https://www.youtube.com/user/WestCoastEaglesFan",
	"https://www.youtube.com/c/TapeCounter/videos",
	"https://www.youtube.com/c/siberianambience/videos",
	"https://www.youtube.com/watch?v=FzRlWoV022k",
	"https://www.youtube.com/watch?v=Wlbf2w6ZCPg&t=2672s",
	"https://www.youtube.com/watch?v=Tf1DEI2lEe0",
	"https://www.youtube.com/watch?v=0hRX-9sYdKw",
	"https://somafm.com/",
	"https://open.spotify.com/playlist/4fC6wXPXXrgsV27NGs4I2v?si=-oDdQqURRpqYwE5ZibT4ZA",
	"https://www.youtube.com/watch?v=_CvASgVAiAo",
	"https://www.youtube.com/results?search_query=psyambient",
	"https://www.youtube.com/watch?v=pGrK6-gOPAI",
	"https://www.di.fm/oldschoolacid",
	"https://www.mixcloud.com/f1rstpers0n/spectra-obsidian",
	"https://www.youtube.com/watch?v=aA6Q-oYrkeQ",
	"https://www.flowful.app/"
]

function getRandomInt(min, max) {
	min = Math.ceil(min);
	max = Math.floor(max);
	return Math.floor(Math.random() * (max - min) + min); //The maximum is exclusive and the minimum is inclusive
}

function openPage() {
	const linkIdx = getRandomInt(0, links.length);
	const link = links[linkIdx];
	const open = spawn('open', [link]);

	open.stdout.on('data', (data) => {
		console.log(`stdout: ${data}`);
	});

	open.stderr.on('data', (data) => {
		console.error(`stderr: ${data}`);
	});

	open.on('close', (code) => {
		console.log(`child process exited with code ${code}`);
	});

}

openPage();
