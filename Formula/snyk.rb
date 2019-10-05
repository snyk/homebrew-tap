class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.231.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.231.0/snyk-macos"
    sha256 "9bf2cc6d431a501d249a624ef9e1094e0f3cfecef3d49dfcadfe9e2da6aca25f"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.231.0/snyk-linux"
    sha256 "3a526a3a62cee5aca8173b5605b6878640142f0326dac40b9b6bba66c654b5cd"
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
