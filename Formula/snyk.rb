class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.239.3"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.239.3/snyk-macos"
    sha256 "93917fcc7a542f12dd27f1387772d001ebc40e7ec5483e85b8eae6b8249fbd15"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.239.3/snyk-linux"
    sha256 "9e6453378e2d92da5a029ac4e515419a17b1d7a1738c28243737da16e1026351"
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
