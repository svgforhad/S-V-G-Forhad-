FROM node:24-slim

# প্রথমে সিস্টেম আপডেট করে গিট (git) এবং অন্যান্য জরুরি টুলস ইনস্টল করে নিন
RUN apt-get update && apt-get install -y git ffmpeg ca-certificates curl

WORKDIR /app

COPY package*.json ./

# এবার টেস্ট করুন গিট কাজ করছে কিনা
RUN git --version

RUN npm install --omit=dev

COPY . .

ENV NODE_ENV=production

EXPOSE 5000

CMD ["node", "index"]
