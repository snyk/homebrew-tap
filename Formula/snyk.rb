class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.251.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.251.1/snyk-macos"
    sha256 "c2210c2b89b247afaea4ceb7acbf1527b918e28c54a7b87523478368857ca1a4"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.251.1/snyk-linux"
    sha256 "0d69124cac73775a9370d52311f61e69559958328ca7a020fd0a19044b65f0ab"
  end

  def install
    original = OS.linux? ? "snyk-linux" : "snyk-macos"
    mv original, "snyk"
    bin.install "snyk"
  end

  test do
    system "#{bin}/snyk --version"
  end
end
