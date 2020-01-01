class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.271.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.271.0/snyk-macos"
    sha256 "fbbccb034449b0d13f083af5f77aa77dac36c0f0acb0d42b0afe041f2665d933"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.271.0/snyk-linux"
    sha256 "16a4535c558a306ba924080a0ec01826452fc32adf68b6a1d573b2b76fb8de07"
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
