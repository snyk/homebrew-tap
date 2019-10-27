class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.239.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.239.0/snyk-macos"
    sha256 "1f89dfcf7b798dca5832a97ff341e104917f7154f8a1d7ef2657aef31dfc4584"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.239.0/snyk-linux"
    sha256 "bc4083a506ad1b0e5c3a36a8c1b3b4368f85c1d43e82bca249cebc13a24e1682"
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
