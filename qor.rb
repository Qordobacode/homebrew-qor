class Qor < Formula
   desc "Cli v2 (using Go)"
   homepage "https://github.com/Qordobacode/Cli-v2"
   url "https://github.com/Qordobacode/Cli-v2/archive/v0.8.3.tar.gz"
   sha256 "0c1536a7efa866b59d2e28971ce789ef12592902ba0f7faf2bdef55e6ed3bcb5"
   head "https://github.com/Qordobacode/Cli-v2.git"

   depends_on "go" => :build

   def install
     ENV["GOPATH"] = buildpath
     src = buildpath/"src/github.com/qordobacode/cli-v2"
     src.install buildpath.children
     src.cd do
       system "go", "build", "-mod", "vendor", "-ldflags", "\"-w -s -X 'github.com/qordobacode/cli-v2/cmd/info.VersionFlag=v0.8.3'\"", "-o", "#{bin}/qor"
       prefix.install_metafiles
     end
   end

   test do
     assert_match "Qordoba Cli v4.0", shell_output("#{bin}/qor --version")
   end
 end